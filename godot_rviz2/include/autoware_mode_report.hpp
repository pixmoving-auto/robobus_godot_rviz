//  Copyright 2024 Teddy Liu. All rights reserved.


#pragma once

#include "core/reference.h"
#include "core/ustring.h"
#include "core/variant.h"
#include "topic_subscriber.hpp"
#include <autoware_auto_vehicle_msgs/msg/control_mode_report.hpp>


class ModeReport : public Reference
{
  GDCLASS(ModeReport, Reference);
  TOPIC_SUBSCRIBER(ModeReport, autoware_auto_vehicle_msgs::msg::ControlModeReport);

public:
  int8_t get_mode_report();

  ModeReport() = default;
  ~ModeReport() = default;

protected:
  static void _bind_methods();
};

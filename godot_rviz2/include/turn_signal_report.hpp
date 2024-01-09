//  Copyright 2024 Teddy Liu. All rights reserved.


#pragma once

#include "core/reference.h"
#include "core/ustring.h"
#include "core/variant.h"
#include "topic_subscriber.hpp"
#include <autoware_auto_vehicle_msgs/msg/turn_indicators_report.hpp>


class TurnSignalReport : public Reference
{
  GDCLASS(TurnSignalReport, Reference);
  TOPIC_SUBSCRIBER(TurnSignalReport, autoware_auto_vehicle_msgs::msg::TurnIndicatorsReport);

public:
  int8_t get_turn_report();

  TurnSignalReport() = default;
  ~TurnSignalReport() = default;

protected:
  static void _bind_methods();
};

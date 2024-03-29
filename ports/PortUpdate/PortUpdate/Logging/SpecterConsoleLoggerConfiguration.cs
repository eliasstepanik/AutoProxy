﻿using System;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;

namespace PortUpdate.Logging;

public sealed class SpecterConsoleLoggerConfiguration
{
    public int EventId { get; set; }

    public Dictionary<LogLevel, ConsoleColor> LogLevelToColorMap { get; set; } = new()
    {
        [LogLevel.Information] = ConsoleColor.DarkGreen
    };
}
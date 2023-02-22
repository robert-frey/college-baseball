change_tm_columns <- function(tm_df) {
  
  char_cols <- c("Date","Time","Pitcher","PitcherId","PitcherThrows","PitcherTeam","Batter",
                 "BatterId","BatterSide","BatterTeam","PitcherSet","Top/Bottom",
                 "TaggedPitchType","AutoPitchType","PitchCall","KorBB","TaggedHitType",
                 "PlayResult","Notes","Tilt","HomeTeam","AwayTeam","Stadium","Level",
                 "League","GameID","PitchUID","GameUID","UTCDate","UTCTime","LocalDateTime",
                 "UTCDateTime","AutoHitType","System","HomeTeamForeignID","AwayTeamForeignID",
                 "Catcher","CatcherId","CatcherThrows","CatcherTeam","PlayID",
                 "PitchReleaseConfidence","PitchLocationConfidence","PitchMovementConfidence",
                 "HitLaunchConfidence","HitLandingConfidence","CatcherThrowCatchConfidence",
                 "CatcherThrowReleaseConfidence","CatcherThrowLocationConfidence")
  
  num_cols <- c("PitchNo","PAofInning","PitchofPA","Inning","Outs","Balls","Strikes",
                "OutsOnPlay","RunsScored","RelSpeed","VertRelAngle","HorzRelAngle","SpinRate",
                "SpinAxis","RelHeight","RelSide","Extension","VertBreak","InducedVertBreak",
                "HorzBreak","PlateLocHeight","PlateLocSide","ZoneSpeed","VertApprAngle",
                "HorzApprAngle","ZoneTime","ExitSpeed","Angle","Direction","HitSpinRate",
                "PositionAt110X","PositionAt110Y","PositionAt110Z","Distance","LastTrackedDistance",
                "Bearing","HangTime","pfxx","pfxz","x0","y0","z0","vx0","vy0","vz0",
                "ax0","ay0","az0","EffectiveVelo","MaxHeight","MeasuredDuration",
                "SpeedDrop","PitchLastMeasuredX","PitchLastMeasuredY","PitchLastMeasuredZ",
                "ContactPositionX","ContactPositionY","ContactPositionZ","PitchTrajectoryXc0",
                "PitchTrajectoryXc1","PitchTrajectoryXc2","PitchTrajectoryYc0","PitchTrajectoryYc1",
                "PitchTrajectoryYc2","PitchTrajectoryZc0","PitchTrajectoryZc1","PitchTrajectoryZc2",
                "HitSpinAxis","HitTrajectoryXc0","HitTrajectoryXc1","HitTrajectoryXc2","HitTrajectoryXc3",
                "HitTrajectoryXc4","HitTrajectoryXc5","HitTrajectoryXc6","HitTrajectoryXc7","HitTrajectoryXc8",
                "HitTrajectoryYc0","HitTrajectoryYc1","HitTrajectoryYc2","HitTrajectoryYc3","HitTrajectoryYc4",
                "HitTrajectoryYc5","HitTrajectoryYc6","HitTrajectoryYc7","HitTrajectoryYc8","HitTrajectoryZc0",
                "HitTrajectoryZc1","HitTrajectoryZc2","HitTrajectoryZc3","HitTrajectoryZc4","HitTrajectoryZc5",
                "HitTrajectoryZc6","HitTrajectoryZc7","HitTrajectoryZc8","ThrowSpeed","PopTime",
                "ExchangeTime","TimeToBase","CatchPositionX","CatchPositionY","CatchPositionZ",
                "ThrowPositionX","ThrowPositionY","ThrowPositionZ","BasePositionX","BasePositionY","BasePositionZ",
                "ThrowTrajectoryXc0","ThrowTrajectoryYc0","ThrowTrajectoryZc0","ThrowTrajectoryXc1",
                "ThrowTrajectoryYc1","ThrowTrajectoryYc2","ThrowTrajectoryXc2","ThrowTrajectoryZc1",
                "ThrowTrajectoryZc2")
  
  df <- tm_df %>%
    dplyr::mutate_at(vars(char_cols), ~as.character(.x))
  
  df <- df %>% 
    dplyr::mutate_at(vars(num_cols), ~as.numeric(as.character(.x)))
  
  
  return(df)
  
}

struct PointOpt { x: Int?; y: Int = 3; }

contract OptNested { pt: PointOpt = PointOpt{ x: null, y: 3 }; }
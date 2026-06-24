// very long contract parameter list stressing nested optionals, primitives, serialization
struct Opts1 { a: Int?; b: Bool? }
struct Opts2 { x: String?; y: Int? }

contract LongParams(
  aa: Int as uint32,
  ab: Bool,
  ac: String,
  ad: Int as int16,
  ae: String?,
  af: Int?,
  ag: Bool?,
  ah: String,
  ai: Int,
  aj: Bool,
  ak: Opts1,
  al: Opts2,
) {}
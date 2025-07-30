struct X { a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; }

contract MixedParams(
 p: X,
 q: Int?,
 r: Bool?,
 s: String?
) {
  receive() { let _ = self.p.a; }
}
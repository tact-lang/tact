struct SOpt {
 a: Int?;
 b: String?;
 c: Bool?;
}
contract Opties {
 f: SOpt;
 init() {
  self.f = SOpt{ a:null, b:null, c:null };
 }
}
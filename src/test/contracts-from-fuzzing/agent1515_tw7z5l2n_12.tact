struct LotsOpt {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Int?;
  f: Bool?;
  g: String?;
  h: Address?;
  i: Int?;
  j: Bool?;
}

contract LotsNulls {
   data: LotsOpt;

   init() {
      self.data = LotsOpt{};
   }

   receive() { dump(self.data.g); }
}

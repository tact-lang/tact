struct WithOptionals {
 a: Int?;
 b: Bool?;
 c: String?;
}

contract OptionalsOverwrite {
 data: WithOptionals;

 init() {
    self.data = WithOptionals{ a: null, b: true, c: null };
 }
}

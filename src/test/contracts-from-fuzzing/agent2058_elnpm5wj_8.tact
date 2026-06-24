struct WithOptionals { a: Int?; b: Bool?; c: String?; d: Int; }

contract Test {
    x: WithOptionals;

    init() {
        self.x = WithOptionals{a:null, b:null, c:null, d:42};
    }
}
struct Rec1 { value: Int; }
struct Rec2 { r1: Rec1; value: Int; }
struct Rec3 { r2: Rec2; value: Int; }
struct Rec4 { r3: Rec3; value: Int; }

contract FeatureTest {
    rec4: Rec4;
    b: Bool;
    s: String?;
    addr: Address;

    init() {
        self.rec4 = Rec4{ r3: Rec3{ r2: Rec2{ r1: Rec1{ value:0 }, value:1 }, value:2 }, value:3 };
        self.b = false;
        self.s = null;
        self.addr = myAddress();
    }
}
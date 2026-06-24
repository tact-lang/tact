struct Layer4 { f: Int; }
struct Layer3 { e: Layer4; }
struct Layer2 { d: Layer3; }
struct Layer1 { c: Layer2; }
struct Layer0 { b: Layer1; }

contract DeepDefault {
    val: Layer0;
    init() {
        self.val = Layer0{ b: Layer1{ c: Layer2{ d: Layer3{ e: Layer4{ f: 111 } } } } };
    }
}
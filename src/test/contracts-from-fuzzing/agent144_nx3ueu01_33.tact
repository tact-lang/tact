struct Layer1 { a: Int }
struct Layer2 { b: Layer1 }
struct Layer3 { c: Layer2 }
struct Layer4 { d: Layer3 }
struct Layer5 { e: Layer4 }

contract DeepFiveNesting {
    v: Layer5;
    init() {
        self.v = Layer5{ e: Layer4{ d: Layer3{ c: Layer2{ b: Layer1{ a:42 }}}}};
    }
}

struct InnerMost { innerVal: Int; }

struct Middle { nested: InnerMost; }

struct Outer { deep: Middle; }

contract VeryDeep {
    deepStruct: Outer;
    init() {
        self.deepStruct = Outer{ deep: Middle{ nested: InnerMost{ innerVal: 42 } } };
    }
}
struct DeepInner { val: Int }
struct Middle { deep: DeepInner }
struct Outer { mid: Middle }

contract DeepNestedStruct {
    s: Outer;
    init() {
        self.s = Outer{ mid: Middle{ deep: DeepInner{ val: 7 } } };
    }
}
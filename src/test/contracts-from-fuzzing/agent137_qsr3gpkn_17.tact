struct DeepNestA { x: Int }
struct DeepNestB { a: DeepNestA }
struct DeepNestC { b: DeepNestB }
struct DeepNestD { c: DeepNestC }
struct DeepNestE { d: DeepNestD }

contract FiveLevelDeep {
    field: DeepNestE;
    init() {
        self.field = DeepNestE{d:DeepNestD{c:DeepNestC{b:DeepNestB{a:DeepNestA{x:42}}}}};
    }
    receive(){}
}
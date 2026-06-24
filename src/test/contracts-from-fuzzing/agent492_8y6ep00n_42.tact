struct DeepNesting1 { next: DeepNesting2 }
struct DeepNesting2 { next: DeepNesting3 }
struct DeepNesting3 { next: DeepNesting4 }
struct DeepNesting4 { x: Int }

contract Test {
    deep: DeepNesting1;
    init() {
        self.deep = DeepNesting1{next: DeepNesting2{next: DeepNesting3{next: DeepNesting4{x:1}}}};
    }
}
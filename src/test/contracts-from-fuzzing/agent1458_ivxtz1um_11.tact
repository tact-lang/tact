struct NestedOptLayer3 { s: String; }
struct NestedOptLayer2 { next: NestedOptLayer3?; }
struct NestedOptLayer1 { next: NestedOptLayer2?; }

contract DeepOptionals {
    data: NestedOptLayer1;

    init() {
        self.data = NestedOptLayer1{
            next: NestedOptLayer2{
                next: null
            }
        };
    }
}
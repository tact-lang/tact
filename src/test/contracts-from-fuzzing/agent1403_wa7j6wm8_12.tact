struct NestedA { s: String; }
struct NestedB { flag: Bool; nested_a: NestedA; }
struct NestedC { value: Int; nested_b: NestedB; }

contract MultiNest {
    data: NestedC;
    init() {
        self.data = NestedC{
            value: 99,
            nested_b: NestedB{
                flag: true,
                nested_a: NestedA{ s: "chain" },
            },
        };
    }
}
// deeply nested with all optional layers populated (non-null)
struct Node3 {
    v: Int;
}
struct Node2 {
    child: Node3?;
}
struct Node1 {
    child: Node2?;
}
contract DeepFilled {
    f: Node1?;
    init() {
        self.f = Node1{
            child: Node2{
                child: Node3{
                    v: 123
                }
            }
        };
    }
}
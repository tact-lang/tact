struct Node5 { next: Node4?; val: Int; }
struct Node4 { next: Node3?; val: Int; }
struct Node3 { next: Node2?; val: Int; }
struct Node2 { next: Node1?; val: Int; }
struct Node1 { next: Node0?; val: Int; }
struct Node0 { val: Int; }

contract DeepOptionals {
    list: Node5;

    init() {
        self.list = Node5{
            val:5,
            next: Node4{
                val:4,
                next: Node3{
                    val:3,
                    next: Node2{
                        val:2,
                        next: Node1{
                            val:1,
                            next: Node0{ val:0 },
                        }
                    }
                }
            }
        };
    }
}
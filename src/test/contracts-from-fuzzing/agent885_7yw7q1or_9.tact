// deeply nested optional struct used as a persistent state variable

struct Leaf { val: String? }

struct Branch { left: Leaf?; right: Leaf? }

struct Root { child: Branch? }

contract TreeLike {
    node: Root;

    init() {
        self.node = Root {
            child: Branch {
                left: Leaf { val: null },
                right: null
            }
        };
    }
}

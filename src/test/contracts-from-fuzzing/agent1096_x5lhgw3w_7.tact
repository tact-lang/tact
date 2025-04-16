struct Leaf { leafVal: Int; }

struct Branch1 { val: Leaf; }
struct Branch2 { val: Branch1; }
struct Branch3 { val: Branch2; }

contract MultiLayerOptional {
    tree: Branch3?;
    init() {
        self.tree = Branch3{
            val: Branch2{
                val: Branch1{
                    val: Leaf{leafVal: 42}
                }
            }
        };
    }
}
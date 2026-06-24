struct Leaf { val: Int? = null }
struct Middle { leaf: Leaf = Leaf{} }
struct Root { mid: Middle = Middle{} }

contract DeepNestedOpt {
    rootVal: Root = Root{};
}
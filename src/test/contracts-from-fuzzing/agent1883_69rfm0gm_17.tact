struct Leaf { x:Int; }
struct Sub { a:Leaf; b:Leaf; }
struct Mid { left:Sub; right:Sub; }

contract DeepWide {
    root:Mid = Mid{
        left:Sub{a:Leaf{x:1},b:Leaf{x:2}},
        right:Sub{a:Leaf{x:3},b:Leaf{x:4}}
    };
}
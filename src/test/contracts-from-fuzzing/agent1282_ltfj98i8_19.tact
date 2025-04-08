struct One { x: Int; }
struct Two { a: One; b: One; }
struct Three { x: Two; y: Two; }
contract ComposeWide {
    val: Three;

    init() {
        self.val = Three{
            x: Two{a:One{x:1},b:One{x:2}},
            y: Two{a:One{x:3},b:One{x:4}}
        };
    }
}
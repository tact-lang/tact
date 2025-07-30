struct X { a: Int; }
struct Y { b: Int; }
struct Z { x: X; y: Y; optx: X?; opty: Y?; label: String; }

contract CombOpt {
    val: Z;

    init() {
        self.val = Z{
            x: X{a:1}, y: Y{b:2}, optx: null, opty: null, label: "lbl"
        };
    }
}
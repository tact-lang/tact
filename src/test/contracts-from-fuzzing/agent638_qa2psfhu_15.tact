struct Info { x: Int; y: Int; label: String; }

contract ExprDefault {
    data: Info = Info{ x:1+2, y:3*4, label: "ab" };

    receive() {}
}
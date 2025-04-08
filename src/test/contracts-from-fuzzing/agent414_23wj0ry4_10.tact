struct Boo { x: Int; y: Int }

contract DefaultStructField {
    point: Boo = Boo{ x: 7, y: 42 };

    init() {}
}
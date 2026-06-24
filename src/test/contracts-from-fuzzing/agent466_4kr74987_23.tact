// deeply nested optional struct fields and optional contract field
struct Bottom { f: Int?; }
struct Middle { m: Bottom?; }
struct Top { t: Middle?; }

contract DeepNestedOptionals {
    root: Top?;

    init() {
        self.root = Top{ t: Middle{ m: Bottom{ f: null } } };
    }
}
struct DeepNestedOptional {
    lvl2: Lvl2?;
}

struct Lvl2 {
    lvl3: Lvl3?;
}

struct Lvl3 {
    lvl4: Lvl4?;
}

struct Lvl4 {
    val: Int?;
}

contract TestContract {
    myField: DeepNestedOptional;

    init() {
        self.myField = DeepNestedOptional{
            lvl2: null
        };
    }
}
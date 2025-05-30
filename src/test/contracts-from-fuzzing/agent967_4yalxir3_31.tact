struct Recursive1 {
    r2: Recursive2?;
}

struct Recursive2 {
    r3: Recursive3?;
}

struct Recursive3 {
    val: Int?;
}

contract OptionalRecursion {
    storage: Recursive1;

    init() {
        self.storage = Recursive1{r2: Recursive2{r3: Recursive3{val: null}}};
    }
}
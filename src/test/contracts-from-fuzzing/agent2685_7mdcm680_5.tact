struct DeepNest3 {
    val: Int?;
}

struct DeepNest2 {
    next: DeepNest3;
}

struct DeepNest1 {
    next: DeepNest2;
}

contract DeepTest {
    deep: DeepNest1 = DeepNest1{
        next: DeepNest2{
            next: DeepNest3{
                val: null
            }
        }
    };
}

primitive Int;

trait BaseTrait {}

trait T {
    f1: Int as int32;
}

trait T2 with T {
    f1: Int as int32;
    f2: Int as int32;
}

trait T3 with T {
    f1: Int as int32;
    f3: Int as int32;
}

trait SomeTrait with T2, T3 {
    f1: Int as int32;
    f2: Int as int32;
    f3: Int as int32;
}

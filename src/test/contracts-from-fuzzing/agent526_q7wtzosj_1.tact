struct DeepNestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    point: Point?;
}

struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract TestContract {
    data: DeepNestedOptional;

    init() {
        self.data = DeepNestedOptional{
            inner: InnerStruct{
                flag: true,
                point: Point{
                    x: 1,
                    y: 2,
                },
            },
        };
    }
}

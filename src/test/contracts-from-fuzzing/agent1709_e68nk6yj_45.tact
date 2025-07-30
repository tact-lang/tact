// Contract with a default-initialized struct containing nested optional
struct S {
    x: Int?;
    y: Int;
}
struct R {
    s: S;
    z: Bool?;
}
contract DefaultNestedOptional {
    data: R = R{ s: S{ x: null, y: 5 }, z: null };
    init() {
        self.data = R{ s: S{ x: 1, y: 2 }, z: true };
    }
}
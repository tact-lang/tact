struct SOptInner {
    v: Int?;
}
struct SOptMiddle {
    m: SOptInner?;
}
struct SOptOuter {
    o: SOptMiddle?;
}
contract OptNestedOptionals {
    field: SOptOuter = SOptOuter{ o: null };
    receive() {
        let _ = self.field.o;
    }
}
struct NestedParam {
    foo: Int;
    bar: Bool?;
}

contract ParamsPersist(
    main: Int,
    nest: NestedParam,
) {
    receive() {
        // trivial
        let _ = self.main + self.nest.foo;
    }
}
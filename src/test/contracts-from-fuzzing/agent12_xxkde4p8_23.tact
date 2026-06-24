struct Example {
    field: Int;
}

fun testRename(s: Example) {
    let Example { field: newAlias } = s;
    dump(newAlias);
}

contract TestDestructRenaming {
    receive() {
        let e: Example = Example { field: 456 };
        testRename(e);
    }
}

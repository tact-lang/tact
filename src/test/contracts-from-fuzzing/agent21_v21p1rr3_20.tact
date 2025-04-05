message Foo { a: Int }

contract TestMessageConversion {
    receive() {
        let m: Foo = Foo { a: 789 };
        let cell: Cell = m.toCell();
        let parsed: Foo = Foo.fromCell(cell);
        dump(parsed.a); // expected 789
        return;
    }
}

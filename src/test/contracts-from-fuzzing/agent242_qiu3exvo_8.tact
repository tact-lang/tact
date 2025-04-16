struct Inner { x: Int; }

contract HasNested {
    nested: Inner = Inner{ x: 5 };
}
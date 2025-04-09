struct Inner { x: Int; }
struct Outer { inn: Inner?; }

contract OptNestedOpt {
    s: Outer?;
}
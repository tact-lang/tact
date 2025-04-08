struct Demo {
    a: Int;
    b: Int?;
}

contract TestContract {
    demo: Demo = Demo{
        a: 5
        // omit 'b', should default to null
    };
}

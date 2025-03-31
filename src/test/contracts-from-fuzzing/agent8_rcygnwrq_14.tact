struct Foo {
    text: String;
}

contract Test {
    receive() {
         // Using a struct with a string field
         let f: Foo = Foo { text: "Hello from struct" };
         let s: String = f.text;
    }
}

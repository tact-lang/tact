struct Person {
    name: String = "John Doe";
    age: Int?;
}

contract TestDefaults {
    receive() {
        let p = Person { age: 30 };
        let Person { name, age } = p;
        dump(name);
        // Unwrap optional age using !! operator; if age is null this would crash at runtime, but here it's non-null
        dump(age!!);
    }
}

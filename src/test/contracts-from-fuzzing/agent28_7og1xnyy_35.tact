contract TestStringBuilderConcat {
    receive() {
        let builder: StringBuilder = beginString();
        let s: String = builder.concat("Hello").concat(" ").concat("World!").toString();
        dump(s);
    }
}

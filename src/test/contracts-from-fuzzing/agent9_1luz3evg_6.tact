struct WithOptional {
    a: Int;
    b: Int?;
}

fun create_opt_data(): WithOptional {
    return WithOptional { a: 10, b: 20 };
}

contract TestOptionalField {
    receive() {
        let data = create_opt_data();
        if (data.b != null) {
            dump(data.b);
        } else {
            dump(0);
        }
    }
}

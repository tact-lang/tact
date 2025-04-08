struct StringStruct {
    str: String;
}

contract StringFieldContract {
    s: StringStruct = StringStruct {
        str: "hello"
    };

    receive() {}
}
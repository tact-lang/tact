struct DataHolder {
    text: String;
}

contract LargeLiteral {
    data: DataHolder = DataHolder{
        text: "This is a long string. This is a long string. This is a long string. This is a long string. This is a long string. This is a long string. This is a long string. This is a long string. This is a long string. This is a long string."
    };
}
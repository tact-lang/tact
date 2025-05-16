struct Strings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    vals: Strings = Strings{
        s1:"hello",s2:"world",s3:"!"
    };
}
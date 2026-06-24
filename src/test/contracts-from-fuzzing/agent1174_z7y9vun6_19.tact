struct MultiStr {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStrings {
    ms: MultiStr = MultiStr{ s1: "a", s2: "b", s3:"c" };
}
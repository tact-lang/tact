struct Info {
    label: String;
    code: Int?;
}

contract TestContract {
    first: Info = Info{label:"one"};
    second: Info = Info{label:"two", code: 2};
    third: Info = Info{label:"three"};
}
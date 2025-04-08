struct HasDefault {
    a: Int = 10;
}

contract ParamDefaultIssue(
    param: HasDefault
) {}
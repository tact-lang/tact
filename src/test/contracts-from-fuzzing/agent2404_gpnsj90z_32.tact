// contract parameter with optional struct
struct InnerParams {
    a: Int;
    flag: Bool;
}

contract ParamOptStruct(
    ip: InnerParams?  
) {}
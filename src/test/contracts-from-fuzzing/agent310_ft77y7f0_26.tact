// Large struct with optional and nested optional fields in params
struct N {
  x:Int?; y:Bool?; z:String?;
}

contract ParamBigNested(
    a:Int?,
    b:String?,
    c:Bool?,
    d:N?,
    e:N,
) {}

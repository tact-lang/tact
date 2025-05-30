struct ComposePrimitives {
    a:Int;
    b:Bool;
    c:String;
}

contract StoreCompose {
    data: ComposePrimitives;
    init() {
        self.data = ComposePrimitives{
            a:1,b:true,c:"hi"
        };
    }
}
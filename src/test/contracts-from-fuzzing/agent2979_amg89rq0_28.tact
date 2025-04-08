struct HasManyOptionals {
    a:Int?; b:Bool?; c:String?; d:Int?; e:Bool?; f:String?;
}

contract StructOptTest {
    var: HasManyOptionals;

    init() {
        self.var = HasManyOptionals{
            a:null, b:true, c:null, d:null, e:false, f:null
        };
    }
}
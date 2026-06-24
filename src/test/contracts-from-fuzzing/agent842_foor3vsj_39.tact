contract OptFieldsDefaults {
  a:Int?=null;
  b:Bool?=null;
  c:String?=null;

  receive(){
    let _=self.a;
  }
}


import Foundation

struct Data:Codable {
    let name:String
    let birthday:String
    
    //包裝
    static func loadData(_ datas:[Data]){
        guard let data = try? JSONEncoder().encode(datas) else { return } //把自定義型別資料包成data
        let userDefault = UserDefaults.standard
        userDefault.set(data, forKey: "datas")
    }
    //解碼
    static func untieData() -> [Data]?{
        let userDefault = UserDefaults.standard
        guard let userDefault = userDefault.data(forKey: "datas") else { return nil }
        return try? JSONDecoder().decode([Data].self, from: userDefault)
    }
}

//
//  File.swift
//  MyLibrary
//
//  Created by Mastere 1 IT on 21/06/2016.
//  Copyright © 2016 triforce. All rights reserved.
//

import Foundation

class BookStore{
    var books :[Book] = []
    
    init(){
        
        let book1 = Book()
        book1.title = "Harry Potter 1"
        book1.author = "JKR"
        book1.description = "blabla"
        books.append(book1)

        
        let book2 = Book()
        book2.title = "Harry Potter 2"
        book2.author = "JKR"
        book2.description = "blablabla"
        books.append(book2)

    }
}
#include <iostream>
#include <cstring>
 
using namespace std;
typedef char str30[31];
 
struct tInfo{
    str30 name;
    int id;
};
 
struct Node{
    tInfo info;
    Node *next;
    Node *prev;
};

void list(Node *nodes);
void start(Node*&curr, tInfo values);
void add(Node*&curr, tInfo values);
void goToStart(Node*&curr);
void goToEnd(Node*&curr);
void showNode(Node* node);

int main()
{
    tInfo tinfo;
    tinfo.id = 1;
    strcpy(tinfo.name,"user1");
    Node* node = new Node();
    start(node,tinfo);

    tinfo.id = 2;
    strcpy(tinfo.name,"user2");
    add(node,tinfo);

    tinfo.id = 2;
    strcpy(tinfo.name,"user3");
    add(node,tinfo);
    list(node);

    return 0;
}

void goToStart(Node*&curr){
    while(curr->prev != NULL){
        curr = curr->prev;
    }
}

void goToEnd(Node*&curr){
    while(curr->next != NULL){
        curr = curr->next;
    }
}


void showNode(Node* node){
    cout<<"id: "<<node->info.id<<endl;
    cout<<"name: "<<node->info.name<<endl;
    cout<<"---------------"<<endl;
}

void list(Node* nodes){
    goToStart(nodes);
    while(nodes != NULL){
        showNode(nodes);
        if(nodes->next != NULL){
            *nodes = *nodes->next;
        }else{
            return;
        }
    }
}

void start(Node*&curr, tInfo values){
        curr->info.id = values.id;
        strcpy(curr->info.name,values.name);  
}
 
void add(Node*&curr, tInfo values){
    while(curr->next != NULL){
        curr = curr->next;
    }
    Node* newNode = new Node();
    newNode->prev = curr;
    newNode->info.id = values.id;
    strcpy(newNode->info.name,values.name);
    curr->next = newNode;
    curr = curr->next;
}
